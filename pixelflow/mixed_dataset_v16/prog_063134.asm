; DESCRIPTION: Places a red 44x47 rectangle at position (80, 195).
; PLAN: r0=80(x), r1=195(y), r2=44(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 195
LDI r2, 44
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
