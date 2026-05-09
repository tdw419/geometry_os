; DESCRIPTION: Renders a white box of size 22x30 starting at (61, 220).
; PLAN: r0=61(x), r1=220(y), r2=22(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 220
LDI r2, 22
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
