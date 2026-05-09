; DESCRIPTION: Renders a cyan box of size 40x30 starting at (440, 44).
; PLAN: r0=440(x), r1=44(y), r2=40(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 44
LDI r2, 40
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
