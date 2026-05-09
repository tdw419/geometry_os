; DESCRIPTION: Renders a cyan box of size 104x20 starting at (72, 142).
; PLAN: r0=72(x), r1=142(y), r2=104(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 142
LDI r2, 104
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
