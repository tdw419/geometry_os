; DESCRIPTION: Places a yellow 22x29 rectangle at position (404, 70).
; PLAN: r0=404(x), r1=70(y), r2=22(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 70
LDI r2, 22
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
