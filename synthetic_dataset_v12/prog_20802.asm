; DESCRIPTION: Places a blue 65x64 rectangle at position (404, 28).
; PLAN: r0=404(x), r1=28(y), r2=65(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 28
LDI r2, 65
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
