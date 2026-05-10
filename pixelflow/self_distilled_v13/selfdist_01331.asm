; DESCRIPTION: Renders a cyan rectangular region spanning 94 by 48 at (196, 47).
; PLAN: r0=196(x), r1=47(y), r2=94(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 47
LDI r2, 94
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
