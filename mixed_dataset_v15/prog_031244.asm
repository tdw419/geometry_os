; DESCRIPTION: Places a red 27x47 rectangle at position (106, 157).
; PLAN: r0=106(x), r1=157(y), r2=27(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 157
LDI r2, 27
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
