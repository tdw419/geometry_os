; DESCRIPTION: Renders a cyan line between points (304, 173) and (405, 190).
; PLAN: r0=304(x1), r1=173(y1), r2=405(x2), r3=190(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 173
LDI r2, 405
LDI r3, 190
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
