; DESCRIPTION: Places a green 65x38 rectangle at position (374, 68).
; PLAN: r0=374(x), r1=68(y), r2=65(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 68
LDI r2, 65
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
