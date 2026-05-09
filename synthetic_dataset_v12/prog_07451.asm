; DESCRIPTION: Composite: Renders a blue line between points (113, 70) and (32, 228) then Places a red dot at position (299, 37).
; PLAN: r0=113(x1), r1=70(y1), r2=32(x2), r3=228(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=299(x), r6=37(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 113
LDI r1, 70
LDI r2, 32
LDI r3, 228
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 299
LDI r6, 37
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
