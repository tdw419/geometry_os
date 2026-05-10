; DESCRIPTION: Composite: Places a blue 89x117 rectangle at position (59, 72) then Places a cyan dot at position (403, 157).
; PLAN: r0=59(x), r1=72(y), r2=89(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=403(x), r6=157(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 59
LDI r1, 72
LDI r2, 89
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 403
LDI r6, 157
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
