; DESCRIPTION: Creates a purple rectangular region at (281, 47) spanning 99 by 68 pixels.
; PLAN: r0=281(x), r1=47(y), r2=99(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 47
LDI r2, 99
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
