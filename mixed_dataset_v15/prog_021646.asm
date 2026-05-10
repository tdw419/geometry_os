; DESCRIPTION: Places a green 99x113 rectangle at position (46, 109).
; PLAN: r0=46(x), r1=109(y), r2=99(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 109
LDI r2, 99
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
