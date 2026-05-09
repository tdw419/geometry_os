; DESCRIPTION: Places a magenta 48x25 rectangle at position (169, 160).
; PLAN: r0=169(x), r1=160(y), r2=48(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 160
LDI r2, 48
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
