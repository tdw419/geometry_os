; DESCRIPTION: Places a green 113x23 rectangle at position (328, 59).
; PLAN: r0=328(x), r1=59(y), r2=113(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 59
LDI r2, 113
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
