; DESCRIPTION: Creates a blue rectangular region at (281, 25) spanning 82 by 93 pixels.
; PLAN: r0=281(x), r1=25(y), r2=82(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 25
LDI r2, 82
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
