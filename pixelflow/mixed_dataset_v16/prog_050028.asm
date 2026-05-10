; DESCRIPTION: Places a red 16x72 rectangle at position (404, 107).
; PLAN: r0=404(x), r1=107(y), r2=16(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 107
LDI r2, 16
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
