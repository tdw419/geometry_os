; DESCRIPTION: Renders a cyan box of size 36x47 starting at (192, 132).
; PLAN: r0=192(x), r1=132(y), r2=36(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 132
LDI r2, 36
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
