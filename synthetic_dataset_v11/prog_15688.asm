; DESCRIPTION: Creates a purple rectangular region at (27, 206) spanning 109 by 39 pixels.
; PLAN: r0=27(x), r1=206(y), r2=109(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 206
LDI r2, 109
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
