; DESCRIPTION: Places a red 27x47 rectangle at position (98, 96).
; PLAN: r0=98(x), r1=96(y), r2=27(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 96
LDI r2, 27
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
