; DESCRIPTION: Renders a cyan box of size 104x25 starting at (48, 33).
; PLAN: r0=48(x), r1=33(y), r2=104(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 33
LDI r2, 104
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
