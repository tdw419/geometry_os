; DESCRIPTION: Renders a cyan box of size 45x115 starting at (198, 124).
; PLAN: r0=198(x), r1=124(y), r2=45(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 124
LDI r2, 45
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
