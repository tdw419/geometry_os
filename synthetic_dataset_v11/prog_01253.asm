; DESCRIPTION: Renders a cyan box of size 112x48 starting at (66, 47).
; PLAN: r0=66(x), r1=47(y), r2=112(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 47
LDI r2, 112
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
