; DESCRIPTION: Renders a cyan box of size 104x103 starting at (313, 2).
; PLAN: r0=313(x), r1=2(y), r2=104(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 2
LDI r2, 104
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
