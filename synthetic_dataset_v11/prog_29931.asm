; DESCRIPTION: Renders a cyan box of size 63x16 starting at (105, 229).
; PLAN: r0=105(x), r1=229(y), r2=63(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 229
LDI r2, 63
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
