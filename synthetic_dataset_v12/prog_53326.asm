; DESCRIPTION: Places a magenta 48x40 rectangle at position (453, 107).
; PLAN: r0=453(x), r1=107(y), r2=48(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 107
LDI r2, 48
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
