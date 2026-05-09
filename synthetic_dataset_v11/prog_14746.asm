; DESCRIPTION: Creates a purple rectangular region at (59, 195) spanning 65 by 50 pixels.
; PLAN: r0=59(x), r1=195(y), r2=65(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 195
LDI r2, 65
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
