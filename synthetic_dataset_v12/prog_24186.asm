; DESCRIPTION: Places a red 78x44 rectangle at position (202, 5).
; PLAN: r0=202(x), r1=5(y), r2=78(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 5
LDI r2, 78
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
