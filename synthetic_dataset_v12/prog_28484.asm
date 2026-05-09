; DESCRIPTION: Places a yellow 120x99 rectangle at position (224, 95).
; PLAN: r0=224(x), r1=95(y), r2=120(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 95
LDI r2, 120
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
