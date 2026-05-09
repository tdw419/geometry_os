; DESCRIPTION: Renders a cyan box of size 84x53 starting at (63, 132).
; PLAN: r0=63(x), r1=132(y), r2=84(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 132
LDI r2, 84
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
