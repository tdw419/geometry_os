; DESCRIPTION: Renders a cyan box of size 102x80 starting at (24, 160).
; PLAN: r0=24(x), r1=160(y), r2=102(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 160
LDI r2, 102
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
