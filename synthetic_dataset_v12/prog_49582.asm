; DESCRIPTION: Places a yellow 119x116 rectangle at position (235, 111).
; PLAN: r0=235(x), r1=111(y), r2=119(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 111
LDI r2, 119
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
