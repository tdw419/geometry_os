; DESCRIPTION: Renders a green box of size 104x86 starting at (387, 8).
; PLAN: r0=387(x), r1=8(y), r2=104(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 8
LDI r2, 104
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
