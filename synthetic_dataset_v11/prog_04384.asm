; DESCRIPTION: Places a green 47x29 rectangle at position (190, 109).
; PLAN: r0=190(x), r1=109(y), r2=47(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 109
LDI r2, 47
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
