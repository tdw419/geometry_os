; DESCRIPTION: Places a magenta 60x76 rectangle at position (171, 65).
; PLAN: r0=171(x), r1=65(y), r2=60(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 65
LDI r2, 60
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
