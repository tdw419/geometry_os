; DESCRIPTION: Renders a cyan rectangular region spanning 63 by 64 at (327, 2).
; PLAN: r0=327(x), r1=2(y), r2=63(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 2
LDI r2, 63
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
