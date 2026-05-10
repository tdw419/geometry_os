; DESCRIPTION: Places a black 64x91 rectangle at position (404, 16).
; PLAN: r0=404(x), r1=16(y), r2=64(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 16
LDI r2, 64
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
