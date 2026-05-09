; DESCRIPTION: Places a yellow 96x116 rectangle at position (91, 54).
; PLAN: r0=91(x), r1=54(y), r2=96(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 54
LDI r2, 96
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
