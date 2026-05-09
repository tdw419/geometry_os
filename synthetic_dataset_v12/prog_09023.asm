; DESCRIPTION: Renders a cyan box of size 63x83 starting at (247, 28).
; PLAN: r0=247(x), r1=28(y), r2=63(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 28
LDI r2, 63
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
