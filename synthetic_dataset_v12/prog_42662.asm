; DESCRIPTION: Renders a cyan box of size 56x80 starting at (230, 44).
; PLAN: r0=230(x), r1=44(y), r2=56(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 44
LDI r2, 56
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
