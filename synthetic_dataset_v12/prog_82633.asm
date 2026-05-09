; DESCRIPTION: Places a green 74x30 rectangle at position (403, 209).
; PLAN: r0=403(x), r1=209(y), r2=74(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 209
LDI r2, 74
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
