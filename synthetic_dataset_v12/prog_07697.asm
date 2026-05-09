; DESCRIPTION: Places a yellow 85x65 rectangle at position (294, 133).
; PLAN: r0=294(x), r1=133(y), r2=85(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 133
LDI r2, 85
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
