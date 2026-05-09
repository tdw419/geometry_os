; DESCRIPTION: Renders a cyan box of size 23x27 starting at (371, 229).
; PLAN: r0=371(x), r1=229(y), r2=23(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 229
LDI r2, 23
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
