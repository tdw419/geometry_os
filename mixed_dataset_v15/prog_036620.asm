; DESCRIPTION: Places a cyan 56x25 rectangle at position (404, 20).
; PLAN: r0=404(x), r1=20(y), r2=56(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 20
LDI r2, 56
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
