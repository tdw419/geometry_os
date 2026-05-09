; DESCRIPTION: Places a orange 92x50 rectangle at position (197, 144).
; PLAN: r0=197(x), r1=144(y), r2=92(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 144
LDI r2, 92
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
