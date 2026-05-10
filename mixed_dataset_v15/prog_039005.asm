; DESCRIPTION: Renders a cyan box of size 49x94 starting at (379, 152).
; PLAN: r0=379(x), r1=152(y), r2=49(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 152
LDI r2, 49
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
