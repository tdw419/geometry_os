; DESCRIPTION: Places a red 91x47 rectangle at position (68, 169).
; PLAN: r0=68(x), r1=169(y), r2=91(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 169
LDI r2, 91
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
