; DESCRIPTION: Draws a black rectangle at (401, 124) with width 92 and height 40.
; PLAN: r0=401(x), r1=124(y), r2=92(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 124
LDI r2, 92
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
