; DESCRIPTION: Renders a cyan box of size 24x80 starting at (371, 129).
; PLAN: r0=371(x), r1=129(y), r2=24(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 129
LDI r2, 24
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
