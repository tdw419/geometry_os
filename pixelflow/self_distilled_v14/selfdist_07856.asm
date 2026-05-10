; DESCRIPTION: Creates a vertical purple gradient from black to purple.
; PLAN: r0=3(x1), r1=1(y), r2=4(width), r3=1(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 1
LDI r2, 4
LDI r3, 1
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
