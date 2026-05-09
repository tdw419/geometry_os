; DESCRIPTION: Renders a cyan box of size 68x105 starting at (440, 137).
; PLAN: r0=440(x), r1=137(y), r2=68(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 137
LDI r2, 68
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
