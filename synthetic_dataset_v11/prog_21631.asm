; DESCRIPTION: Places a green 82x49 rectangle at position (67, 169).
; PLAN: r0=67(x), r1=169(y), r2=82(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 169
LDI r2, 82
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
