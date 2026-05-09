; DESCRIPTION: Renders a cyan box of size 14x91 starting at (459, 37).
; PLAN: r0=459(x), r1=37(y), r2=14(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 37
LDI r2, 14
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
