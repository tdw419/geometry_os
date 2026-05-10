; DESCRIPTION: Renders a blue box of size 86x47 starting at (66, 143).
; PLAN: r0=66(x), r1=143(y), r2=86(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 143
LDI r2, 86
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
