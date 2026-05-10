; DESCRIPTION: Places a white 90x16 box at position (275, 169).
; PLAN: r0=275(x), r1=169(y), r2=90(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 169
LDI r2, 90
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
