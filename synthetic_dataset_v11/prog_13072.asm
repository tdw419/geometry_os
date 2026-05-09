; DESCRIPTION: Renders a cyan box of size 36x104 starting at (123, 52).
; PLAN: r0=123(x), r1=52(y), r2=36(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 52
LDI r2, 36
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
